"""Generates the Command Center app icon (source, 1024x1024) and the
animated-splash logo (transparent PNG) from simple vector shapes.

Mark: a radar/compass ring with a sweep and a center dot — "command center"
as in watching and directing, which fits capturing and reviewing decisions.
Run with: python3 generate_icon.py
"""
import math
from PIL import Image, ImageDraw

SIZE = 1024
BG = (63, 81, 181, 255)  # indigo, matches the app's colorSchemeSeed
BG_DARK = (40, 53, 147, 255)
WHITE = (255, 255, 255, 255)
SWEEP = (255, 255, 255, 90)


def rounded_square_mask(size, radius):
    mask = Image.new("L", (size, size), 0)
    d = ImageDraw.Draw(mask)
    d.rounded_rectangle([0, 0, size - 1, size - 1], radius=radius, fill=255)
    return mask


def draw_mark(draw, cx, cy, r):
    # Outer ring
    ring_w = max(int(r * 0.09), 4)
    draw.ellipse([cx - r, cy - r, cx + r, cy + r], outline=WHITE, width=ring_w)

    # Radar sweep wedge (from center, 60 degrees, pointing to upper-right)
    sweep_r = r - ring_w
    draw.pieslice(
        [cx - sweep_r, cy - sweep_r, cx + sweep_r, cy + sweep_r],
        start=-75,
        end=-15,
        fill=SWEEP,
    )

    # Four tick marks (N/E/S/W), like a compass
    tick_len = r * 0.16
    tick_w = max(int(r * 0.05), 3)
    for angle_deg in (0, 90, 180, 270):
        a = math.radians(angle_deg)
        x1 = cx + math.cos(a) * (r - ring_w)
        y1 = cy + math.sin(a) * (r - ring_w)
        x2 = cx + math.cos(a) * (r - ring_w - tick_len)
        y2 = cy + math.sin(a) * (r - ring_w - tick_len)
        draw.line([x1, y1, x2, y2], fill=WHITE, width=tick_w)

    # Center dot
    dot_r = r * 0.14
    draw.ellipse([cx - dot_r, cy - dot_r, cx + dot_r, cy + dot_r], fill=WHITE)

    # Needle from center toward the sweep direction
    needle_a = math.radians(-45)
    nx = cx + math.cos(needle_a) * (r - ring_w)
    ny = cy + math.sin(needle_a) * (r - ring_w)
    draw.line([cx, cy, nx, ny], fill=WHITE, width=max(int(r * 0.05), 3))


def make_app_icon():
    img = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # Background: soft vertical gradient inside a rounded square.
    grad = Image.new("RGBA", (1, SIZE), (0, 0, 0, 0))
    for y in range(SIZE):
        t = y / SIZE
        color = tuple(int(BG[i] * (1 - t) + BG_DARK[i] * t) for i in range(3)) + (255,)
        grad.putpixel((0, y), color)
    grad = grad.resize((SIZE, SIZE))
    mask = rounded_square_mask(SIZE, int(SIZE * 0.22))
    img.paste(grad, (0, 0), mask)

    draw_mark(d, SIZE // 2, SIZE // 2, SIZE * 0.32)
    img.save("app_icon.png")

    # Android adaptive icon foreground: mark only, transparent background,
    # sized to fit the safe zone (~66% of canvas).
    fg = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    draw_mark(ImageDraw.Draw(fg), SIZE // 2, SIZE // 2, SIZE * 0.28)
    fg.save("app_icon_foreground.png")


def make_splash_logo():
    # Transparent PNG of just the mark, for the in-app splash animation.
    size = 512
    img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    circle_bg = (63, 81, 181, 255)
    r = size * 0.46
    d.ellipse(
        [size / 2 - r, size / 2 - r, size / 2 + r, size / 2 + r], fill=circle_bg
    )
    draw_mark(d, size // 2, size // 2, size * 0.34)
    img.save("splash_logo.png")


if __name__ == "__main__":
    make_app_icon()
    make_splash_logo()
    print("Wrote app_icon.png, app_icon_foreground.png, splash_logo.png")
