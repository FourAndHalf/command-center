"""Generates the Command Center app icon and splash logo from the mark in
design/icon.png: a white outlined triangle with a center dot, ringed by a
dashed circle, on the design system's deep-zinc canvas (#09090B).

Run with: python3 generate_icon.py
"""
import math
from PIL import Image, ImageDraw

SIZE = 1024
CANVAS = (9, 9, 11, 255)  # design/DESIGN.md canvas #09090B
WHITE = (250, 250, 250, 255)  # design/DESIGN.md on-surface #FAFAFA


def rounded_square_mask(size, radius):
    mask = Image.new("L", (size, size), 0)
    d = ImageDraw.Draw(mask)
    d.rounded_rectangle([0, 0, size - 1, size - 1], radius=radius, fill=255)
    return mask


def draw_dashed_circle(draw, cx, cy, r, width, n_dashes=28, dash_fraction=0.55):
    step = 360 / n_dashes
    dash_deg = step * dash_fraction
    for i in range(n_dashes):
        start = i * step
        draw.arc(
            [cx - r, cy - r, cx + r, cy + r],
            start=start,
            end=start + dash_deg,
            fill=WHITE,
            width=width,
        )


def draw_mark(img, cx, cy, r):
    draw = ImageDraw.Draw(img)

    # Dashed ring
    ring_width = max(int(r * 0.045), 3)
    draw_dashed_circle(draw, cx, cy, r, ring_width)

    # Open triangle (apex up), inscribed with headroom inside the ring
    tri_r = r * 0.66
    tri_width = max(int(r * 0.07), 4)
    angles = [-90, 150, 30]  # apex up, then bottom-left, bottom-right
    points = [
        (cx + tri_r * math.cos(math.radians(a)), cy + tri_r * math.sin(math.radians(a)))
        for a in angles
    ]
    draw.line(points + [points[0]], fill=WHITE, width=tri_width, joint="curve")

    # Center dot
    dot_r = r * 0.10
    draw.ellipse([cx - dot_r, cy - dot_r, cx + dot_r, cy + dot_r], fill=WHITE)


def make_app_icon():
    img = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    bg = Image.new("RGBA", (SIZE, SIZE), CANVAS)
    mask = rounded_square_mask(SIZE, int(SIZE * 0.22))
    img.paste(bg, (0, 0), mask)
    draw_mark(img, SIZE // 2, SIZE // 2, SIZE * 0.30)
    img.save("app_icon.png")

    # Android adaptive icon foreground: mark only, transparent background,
    # scaled down to fit the safe zone.
    fg = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    draw_mark(fg, SIZE // 2, SIZE // 2, SIZE * 0.24)
    fg.save("app_icon_foreground.png")


def make_splash_logo():
    # Transparent PNG of just the mark, for the in-app splash animation
    # (drawn over the app's canvas-colored background).
    size = 512
    img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    draw_mark(img, size // 2, size // 2, size * 0.42)
    img.save("splash_logo.png")


if __name__ == "__main__":
    make_app_icon()
    make_splash_logo()
    print("Wrote app_icon.png, app_icon_foreground.png, splash_logo.png")
