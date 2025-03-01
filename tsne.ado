*! version 1.0.0 27Feb2025
program define tsne
    version 16.0
    syntax varlist(min=2) [if] [in], ///
        PERPLEXITY(real 30) ITER(int 1000) LR(real 200) ///
        [PREFIX(string "tsne")]

    // Create a temporary file to store data for Python
    tempfile tsnedata
    preserve
    keep `varlist'
    save "`tsnedata'", replace
    restore

    // Python integration block to run t-SNE
    python:
import pandas as pd
from sklearn.manifold import TSNE
import stata_setup
import os

# Get parameters from Stata
perplexity = float(stata.get("PERPLEXITY"))
n_iter = int(stata.get("ITER"))
learning_rate = float(stata.get("LR"))
prefix = stata.get("PREFIX")

# Read the temporary Stata dataset
tsne_datafile = stata.get("tsnedata")
df = pd.read_stata(tsne_datafile)

# Perform t-SNE on the data (assuming numeric variables only)
tsne_model = TSNE(n_components=2, perplexity=perplexity, 
                  n_iter=n_iter, learning_rate=learning_rate, random_state=42)
tsne_results = tsne_model.fit_transform(df)

# Create new column names for the t-SNE dimensions
col_names = [f"{prefix}1", f"{prefix}2"]

# Add the t-SNE results to the dataframe
df_tsne = pd.DataFrame(tsne_results, columns=col_names)

# Save the t-SNE coordinates as a new Stata dataset
output_file = os.path.join(os.getcwd(), "tsne_results.dta")
df_tsne.to_stata(output_file, write_index=False)

# Pass the output file name back to Stata
stata.set("output_file", output_file)
    end
    // End of Python integration block

    // Merge the t-SNE results back into the current dataset
    use "`tsnedata'", clear
    merge 1:1 _n using "`=c(pwd)'/tsne_results.dta", nogenerate

    di as text "t-SNE transformation completed. New variables added:"
    di as result "`PREFIX'1 and `PREFIX'2"
end
