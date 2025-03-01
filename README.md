# tsne: t‑Distributed Stochastic Neighbor Embedding for Stata

**Version 1.0.0** • Developed by [Your Name]

## Overview

**tsne** is a Stata module that brings modern, non-linear dimensionality reduction to your data analysis workflow by implementing t‑Distributed Stochastic Neighbor Embedding (t‑SNE). Built on top of Python’s robust scikit‑learn library and seamlessly integrated into Stata (version 16 and later), tsne lets you visualize complex high-dimensional datasets directly within your familiar Stata environment.

## Key Features

- **Integrated Python Support:** Utilizes Stata’s built-in Python integration for powerful computations.
- **Easy-to-Use Syntax:** Simple command structure to quickly transform your data.
- **Customizable Options:** Set parameters for perplexity, iterations, learning rate, and coordinate variable naming.
- **Visualize High-Dimensional Data:** Easily reduce your data to two dimensions for exploratory analysis and visualization.

## Requirements

- **Stata Version 16 or Later:** For full Python integration.
- **Python Installed:** Ensure Python is installed along with the [scikit‑learn](https://scikit-learn.org/) library.
- **Write Permissions:** The working directory must allow temporary file creation for data exchange between Stata and Python.

## Installation

You can install **tsne** using Stata's `net install` command if the module is hosted online or manually copy the `tsne.ado` and `tsne.sthlp` files into your Stata PERSONAL or SITE directory.

For example, if hosted on GitHub pages:
```stata
net install tsne, from("https://yourdomain.com/path/to/tsne")
```

Alternatively, clone the repository:
```bash
git clone https://github.com/yourusername/tsne.git
```
and copy the module files to your Stata adopath.

## Usage

The syntax for using tsne is straightforward. For example:
```stata
tsne x1 x2 x3, PERPLEXITY(30) ITER(500) LR(200)
```
This command applies t‑SNE to the variables `x1`, `x2`, and `x3` with a perplexity of 30, 500 iterations, and a learning rate of 200. The resulting low‑dimensional coordinates will be stored as `tsne1` and `tsne2`.

For more detailed documentation, type:
```stata
help tsne
```
in your Stata command window.

## Examples

- **Basic Usage:**
  ```stata
  tsne x1 x2 x3, PERPLEXITY(30) ITER(500) LR(200)
  ```
- **Using a Custom Prefix:**
  ```stata
  tsne var1 var2 var3, PERPLEXITY(50) ITER(750) LR(100) PREFIX(mytsne)
  ```

## Citation

If you find this module useful in your research, please consider citing it as follows:

> [Your Name]. (2025). *tsne: t‑Distributed Stochastic Neighbor Embedding in Stata* [Stata module]. Version 1.0.0. Available at: [URL or DOI].

## Contributing

Contributions are welcome! If you have suggestions, bug fixes, or new features, please submit an issue or a pull request on GitHub. For major changes, please open an issue first to discuss your ideas.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions, suggestions, or bug reports, please contact [Your Name] at [your.email@example.com] or visit the [GitHub repository](https://github.com/yourusername/tsne).
