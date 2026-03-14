import matplotlib.pyplot as plt
import numpy as np
from shapely.geometry import Polygon
from shapely.ops import unary_union

XMIN, YMIN, XMAX, YMAX = 3, 3, 8, 8
SUBJECT_POLY = Polygon([(2, 2), (10, 2), (10, 10), (2, 10)])
CLIP_POLY = Polygon([(XMIN, YMIN), (XMAX, YMIN), (XMAX, YMAX), (XMIN, YMAX)])

def weiler_atherton_clip(SUBJECT, CLIP):
    try:
        INTERSECTION = SUBJECT.intersection(CLIP)
        return INTERSECTION
    except:
        return None

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.grid(True)
plt.title('Original Subject Polygon')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')
X_SUBJ, Y_SUBJ = SUBJECT_POLY.exterior.xy
plt.plot(X_SUBJ, Y_SUBJ, 'r-', linewidth=2, label='Subject Polygon')
plt.fill(X_SUBJ, Y_SUBJ, 'r', alpha=0.3)
X_CLIP, Y_CLIP = CLIP_POLY.exterior.xy
plt.plot(X_CLIP, Y_CLIP, 'b-', linewidth=2, label='Clip Polygon')
plt.fill(X_CLIP, Y_CLIP, 'b', alpha=0.1)
plt.xlim(0, 12); plt.ylim(0, 12)
plt.legend()

plt.subplot(1, 2, 2)
plt.grid(True)
plt.title('Weiler-Atherton Clipping Result')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')

RESULT = weiler_atherton_clip(SUBJECT_POLY, CLIP_POLY)
if RESULT and not RESULT.is_empty:
    if RESULT.geom_type == 'Polygon':
        X_RES, Y_RES = RESULT.exterior.xy
        plt.plot(X_RES, Y_RES, 'g-', linewidth=2.5, label='Clipped Polygon')
        plt.fill(X_RES, Y_RES, 'g', alpha=0.5)
    elif RESULT.geom_type == 'MultiPolygon':
        for POLY in RESULT.geoms:
            X_RES, Y_RES = POLY.exterior.xy
            plt.plot(X_RES, Y_RES, 'g-', linewidth=2.5)
            plt.fill(X_RES, Y_RES, 'g', alpha=0.5)

plt.plot(X_CLIP, Y_CLIP, 'b--', linewidth=1.5, alpha=0.5, label='Clip Window')
plt.xlim(0, 12); plt.ylim(0, 12)
plt.legend()

plt.tight_layout()
plt.show()
