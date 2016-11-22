import os
import shutil

search_dir = os.getcwd()

os.chdir(search_dir)
files = filter(os.path.isfile, os.listdir(search_dir))
files = [os.path.join(search_dir, f) for f in files] 
files.sort(key=lambda x: os.path.getmtime(x))

dir = "sorted"

os.system("sudo mkdir -p " + dir)

extension=".jpg"
i=1

for filename in files:
	destination = "sorted/" + str(i) + extension
	shutil.copy(filename,destination)
	i = i + 1
print "Copied all files to 'sorted' directory"
