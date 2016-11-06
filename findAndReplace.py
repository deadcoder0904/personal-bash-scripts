import os

def findAndReplace(htmlpath):
	filedata = None
	with open(htmlpath, 'r') as file :
	  filedata = file.read()

	# Replace the target string
	filedata = filedata.replace('vendor', 'lib')

	# Write the file out again
	with open(htmlpath, 'w') as file:
	  file.write(filedata)

for dirpath, dirnames, filenames in os.walk("."):
    for filename in [f for f in filenames if f.endswith(".html")]:
        print os.path.join(dirpath, filename)
        findAndReplace(os.path.join(dirpath, filename))
