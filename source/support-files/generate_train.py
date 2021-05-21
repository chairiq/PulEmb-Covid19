import os

image_files = []
os.chdir(os.path.join("data", "ctscans-train"))
for filename in os.listdir(os.getcwd()):
    if filename.endswith(".jpg"):
        image_files.append("data/ctscans-train/" + filename)
os.chdir("..")
with open("ctscans-train.txt", "w") as outfile:
    for image in image_files:
        outfile.write(image)
        outfile.write("\n")
    outfile.close()
os.chdir("..")