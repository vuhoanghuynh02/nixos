import os
import shutil
from pathlib import Path
import sys


def main(home_dir):
    home = Path(home_dir)
    Downloads = home / "Downloads"

    home_fol = ["Documents", "Music", "Pictures", "Videos"]
    for name in home_fol:
        if os.path.exists(home / name):
            assert not os.path.exists(Downloads / name)
            shutil.move(home / name, Downloads / name)


if __name__ == "__main__":
    main(sys.argv[1])
