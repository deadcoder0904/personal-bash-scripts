filedata = None
with open('index.html', 'r') as file :
  filedata = file.read()

# Replace the target string
filedata = filedata.replace('vendor', 'lib')

# Write the file out again
with open('index.html', 'w') as file:
  file.write(filedata)
