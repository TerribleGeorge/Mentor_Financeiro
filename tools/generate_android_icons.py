from __future__ import annotations

import argparse
from pathlib import Path

from PIL import Image


def _contain_on_square_rgba(src: Image.Image, size: int) -> Image.Image:
    """
    Scale to fit within (size x size) without cropping, preserving transparency.
    Result is centered on a transparent square canvas.
    """
    src = src.convert("RGBA")

    w, h = src.size
    if w <= 0 or h <= 0:
        raise ValueError("Invalid source image dimensions.")

    scale = min(size / w, size / h)
    new_w = max(1, int(round(w * scale)))
    new_h = max(1, int(round(h * scale)))
    resized = src.resize((new_w, new_h), resample=Image.Resampling.LANCZOS)

    canvas = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    x = (size - new_w) // 2
    y = (size - new_h) // 2
    canvas.alpha_composite(resized, (x, y))
    return canvas


def _save_png(img: Image.Image, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    img.save(path, format="PNG", optimize=True)


def generate(
    *,
    source_png: Path,
    android_res_dir: Path,
    mipmap_name: str = "launcher_icon",
    foreground_name: str = "ic_launcher_foreground",
) -> None:
    if not source_png.exists():
        raise FileNotFoundError(f"Source image not found: {source_png}")

    src = Image.open(source_png)

    # Legacy launcher icons (mipmap)
    mipmap_sizes = {
        "mipmap-mdpi": 48,
        "mipmap-hdpi": 72,
        "mipmap-xhdpi": 96,
        "mipmap-xxhdpi": 144,
        "mipmap-xxxhdpi": 192,
    }

    # Adaptive icon foreground sizes (drawable) — standard launcher foreground pixel sizes per density.
    foreground_sizes = {
        "drawable-mdpi": 108,
        "drawable-hdpi": 162,
        "drawable-xhdpi": 216,
        "drawable-xxhdpi": 324,
        "drawable-xxxhdpi": 432,
    }

    for folder, size in mipmap_sizes.items():
        out = android_res_dir / folder / f"{mipmap_name}.png"
        _save_png(_contain_on_square_rgba(src, size), out)

    for folder, size in foreground_sizes.items():
        out = android_res_dir / folder / f"{foreground_name}.png"
        _save_png(_contain_on_square_rgba(src, size), out)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Generate Android launcher icons without cropping (contain + centered)."
    )
    parser.add_argument(
        "--source",
        default="Generated_image.png",
        help="Path to source PNG (default: Generated_image.png)",
    )
    parser.add_argument(
        "--res",
        default="mentor_financeiro/android/app/src/main/res",
        help="Path to android res/ directory",
    )
    parser.add_argument(
        "--mipmap-name",
        default="launcher_icon",
        help="Launcher icon base name in mipmap-* folders (default: launcher_icon)",
    )
    parser.add_argument(
        "--foreground-name",
        default="ic_launcher_foreground",
        help="Adaptive foreground base name in drawable-* folders (default: ic_launcher_foreground)",
    )
    args = parser.parse_args()

    generate(
        source_png=Path(args.source).resolve(),
        android_res_dir=Path(args.res).resolve(),
        mipmap_name=args.mipmap_name,
        foreground_name=args.foreground_name,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

