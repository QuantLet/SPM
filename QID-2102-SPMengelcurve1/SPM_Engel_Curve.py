"""
Python reproduction of QuantLet:
QID-2102-SPMengelcurve1

The original R code computes a Nadaraya-Watson Gaussian-kernel
regression of food expenditure (column 4) on net income (column 1).
"""

from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def r_ksmooth_normal(x, y, bandwidth=0.2, n_points=None):
    """
    Reproduce R's stats::ksmooth(..., kernel="normal").

    R scales the normal kernel so that its quartiles are located at
    +/- 0.25 * bandwidth. Since the standard-normal upper quartile is
    0.6744897501960817, the corresponding Gaussian standard deviation is

        sigma = 0.25 * bandwidth / 0.6744897501960817.
    """
    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)

    valid = np.isfinite(x) & np.isfinite(y)
    x, y = x[valid], y[valid]

    order = np.argsort(x)
    x, y = x[order], y[order]

    if n_points is None:
        n_points = max(100, len(x))

    x_grid = np.linspace(x.min(), x.max(), n_points)
    sigma = 0.25 * bandwidth / 0.6744897501960817
    y_smooth = np.empty_like(x_grid)

    # Looping over the grid avoids allocating a very large weight matrix.
    for j, x0 in enumerate(x_grid):
        z = (x - x0) / sigma
        weights = np.exp(-0.5 * z**2)
        weight_sum = weights.sum()

        y_smooth[j] = (
            np.dot(weights, y) / weight_sum
            if weight_sum > 0
            else np.nan
        )

    return x_grid, y_smooth


def main():
    # The data file must be in the same folder as this Python script.
    script_dir = Path(__file__).resolve().parent
    data_path = script_dir / "agg73sh.dat"

    if not data_path.exists():
        raise FileNotFoundError(
            f"Data file not found:\n{data_path}\n\n"
            "Place agg73sh.dat in the same folder as this script."
        )

    # Whitespace-separated file with no header, matching R's read.table().
    data = pd.read_csv(data_path, sep=r"\s+", header=None)

    if data.shape[1] < 4:
        raise ValueError(
            f"Expected at least 4 columns, but found {data.shape[1]}."
        )

    x = data.iloc[:, 0].to_numpy(dtype=float)  # net income
    y = data.iloc[:, 3].to_numpy(dtype=float)  # food expenditure
    bandwidth = 0.2

    x_grid, y_smooth = r_ksmooth_normal(
        x, y, bandwidth=bandwidth
    )

    plt.figure(figsize=(8, 5.5))
    plt.scatter(
        x, y,
        s=14,
        alpha=0.65,
        label="UK 1973 expenditure data"
    )
    plt.plot(
        x_grid, y_smooth,
        linewidth=2.2,
        label="Gaussian kernel regression"
    )

    plt.title("Engel Curve")
    plt.xlabel("Net income")
    plt.ylabel("Food")
    plt.figtext(
        0.5, 0.01,
        f"Bandwidth h = {bandwidth}",
        ha="center"
    )
    plt.legend(frameon=False)
    plt.tight_layout(rect=(0, 0.04, 1, 1))

    output_path = script_dir / "SPMengelcurve1_python.png"
    plt.savefig(output_path, dpi=220, transparent=True)
    plt.show()

    print(f"Figure saved to:\n{output_path}")


if __name__ == "__main__":
    main()
