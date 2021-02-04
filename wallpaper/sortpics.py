#!/usr/bin/python
import subprocess
import re

imageRE = re.compile(r"(?<!Landscape)(?<!Portrait).*\.(jpg|JPG|png|PNG)")
sizeRE = re.compile(r"(\d+)x(\d+)")
folderRE = re.compile(r"(/?[^/]*/)")

#get list of pictures
list_of_files = subprocess.run("find ~/.wallpaper -follow -maxdepth 2 -type f ", shell=True, capture_output=True, encoding="utf-8").stdout.split('\n')
list_of_images = [f for f in list_of_files if imageRE.search(f)]

# create folders if they don't exist
subprocess.run(["mkdir", "-p", "Portrait"])
subprocess.run(["mkdir", "-p", "Landscape"])

for pic in list_of_images:
    # get image size from identify
    imageinfo = subprocess.run(["identify", pic], capture_output=True, encoding="utf-8").stdout
    m = sizeRE.search(imageinfo)
    if m:
        width = int(m.group(1))
        height = int(m.group(2))

        # capture subfolder info
        folderinfo = folderRE.findall(pic)
        subfolder = ""
        if folderinfo:
            subfolder = folderinfo[-1]

        # determine if it's portrait or landscape;
        # put it in the right folder
        if width > height:
            subprocess.run(["mv", pic, "Landscape/"+subfolder])
        else:
            subprocess.run(["mv", pic, "Portrait/"+subfolder])
