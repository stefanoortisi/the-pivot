fsu  = require 'fs-util'
path = require 'path'

Pivot = require 'pivot'

# list of test files
files = fsu.find (path.join __dirname, 'functional'), /\.coffee$/m

pivot = new Pivot()

for file in files
  
  test = require file
  test pivot