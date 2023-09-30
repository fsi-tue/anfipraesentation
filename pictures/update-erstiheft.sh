#! /bin/sh

# ⚠ This script requires qpdf ⚠

wget https://teri.fsi.uni-tuebingen.de/anfiheft/anfiheft-info.pdf
qpdf anfiheft-info.pdf --pages . 1-1 -- erstiheft.pdf
rm anfiheft-info.pdf anfiheft-info.pdf.1
