{smcl}
{* *! version 1.0.0 27Feb2025}
{vieweralsosee "ftools" "help ftools"}
{viewerjumpto "Syntax" "tsne##syntax"}
{viewerjumpto "Description" "tsne##description"}
{viewerjumpto "Options" "tsne##options"}
{viewerjumpto "Usage" "tsne##usage"}
{viewerjumpto "Examples" "tsne##examples"}
{viewerjumpto "Requirements" "tsne##requirements"}
{viewerjumpto "Citation" "tsne##citation"}
{viewerjumpto "License" "tsne##license"}
{viewerjumpto "Notes" "tsne##notes"}
{title: tsne — t‑Distributed Stochastic Neighbor Embedding in Stata}

{marker syntax}{*}
{title:Syntax}
{p 8 17 2}
{cmd:tsne} {it:varlist} [if] [in], PERPLEXITY({it:real 30}) ITER({it:integer 1000}) LR({it:real 200}) [PREFIX({it:string "tsne"})]
{p_end}

{marker description}{*}
{title:Description}
{pstd}
The {cmd:tsne} command performs t‑Distributed Stochastic Neighbor Embedding (t‑SNE), a nonlinear dimensionality reduction technique on a set of numeric variables.
It leverages Python's scikit‑learn implementation via Stata's integrated Python environment (available in Stata 16 and later) to project high‑dimensional data onto a low‑dimensional space.
This transformation is especially useful for visualizing complex datasets.
{p_end}

{marker options}{*}
{title:Options}
{pstd}
• {cmd:PERPLEXITY}({it:real 30})  
  Sets the perplexity parameter. Default is 30.
{p_end}
{pstd}
• {cmd:ITER}({it:integer 1000})  
  Specifies the number of iterations. Default is 1000.
{p_end}
{pstd}
• {cmd:LR}({it:real 200})  
  Sets the learning rate for t‑SNE. Default is 200.
{p_end}
{pstd}
• {cmd:PREFIX}({it:string "tsne"})  
  Specifies a prefix for naming the new t‑SNE coordinate variables.
  Default creates {it:tsne1} and {it:tsne2}; a custom prefix yields variables named "<prefix>1" and "<prefix>2".
{p_end}

{marker usage}{*}
{title:Usage}
{pstd}
1. Specify the numeric variables for transformation using {it:varlist}.
{p_end}
{pstd}
2. Provide parameters for perplexity, iterations, and learning rate.
{p_end}
{pstd}
3. The command adds two new variables to your dataset containing the t‑SNE coordinates.
{p_end}
{pstd}
4. Use these new variables for plotting or further analysis.
{p_end}

{marker examples}{*}
{title:Examples}
{pstd}
Example 1: Basic usage with default variable names.
{p_end}

{p 8 17 2}
. {cmd:tsne} x1 x2 x3, PERPLEXITY(30) ITER(500) LR(200)
{p_end}

{pstd}
This command applies t‑SNE to variables {it:x1 x2 x3} using a perplexity of 30, 500 iterations, and a learning rate of 200.
The resulting dimensions are stored as {it:tsne1} and {it:tsne2}.
{p_end}

{pstd}
Example 2: Using a custom prefix.
{p_end}

{p 8 17 2}
. {cmd:tsne} var1 var2 var3, PERPLEXITY(50) ITER(750) LR(100) PREFIX(mytsne)
{p_end}

{pstd}
This command applies t‑SNE with custom parameters and stores the resulting dimensions as {it:mytsne1} and {it:mytsne2}.
{p_end}

{marker requirements}{*}
{title:Requirements}
{pstd}
• Stata version 16 or later (for Python integration).
{p_end}
{pstd}
• Python installed with the scikit‑learn library.
{p_end}
{pstd}
• Write permissions in the working directory for temporary file creation.
{p_end}

{marker citation}{*}
{title:Citation}
{pstd}
If you use this module in your research, please cite it as follows:
{p_end}
{pstd}
Kenny Ching. (2025). {it:tsne: t‑Distributed Stochastic Neighbor Embedding in Stata} [Stata module]. Version 1.0.0. Available at: DOI 10.17605/OSF.IO/R3UEC
{p_end}

{marker license}{*}
{title:License}
{pstd}
This module is licensed under the MIT License. See the LICENSE file for details.
{p_end}
{pstd}
MIT License
{p_end}
{pstd}
Copyright (c) 2025 Kenny Ching
{p_end}
{pstd}
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
{p_end}
{pstd}
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
{p_end}
{pstd}
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
{p_end}

{marker notes}{*}
{title:Notes}
{pstd}
• All variables in the {it:varlist} must be numeric.
{p_end}
{pstd}
• The t‑SNE algorithm may be computationally intensive on large datasets; adjust parameters accordingly.
{p_end}
{pstd}
• Temporary files are used for data exchange between Stata and Python; ensure that your working directory permits file creation.
{p_end}

{smcl}
