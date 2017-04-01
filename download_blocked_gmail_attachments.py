import email
import sys
import os

if __name__ == '__main__':
  if len(sys.argv) < 2:
    print("Press enter to process all files with .txt extension.")
    raw_input()
    files = [ f for f in os.listdir('.') if os.path.isfile(f) and f.endswith('.txt') ]
  else:
    files = sys.argv[1:]

  print("Files: %s" % ', '.join(files))
  print()

  for f in files:
    msg = email.message_from_file(open(f))
    print("Processing %s" % f)
    print("Subject: %s" % msg['Subject'])
    for pl in msg.get_payload():
      fn = pl.get_filename()
      if fn:
        print("Found %s" % fn)
        if os.path.isfile(fn):
          print("The file %s already exists! Press enter to overwrite." % fn)
          input()
        open(fn, 'wb').write(pl.get_payload(decode=True))
    print()