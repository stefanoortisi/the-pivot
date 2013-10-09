# The Pivot

Simple event system and key->value storage


[![Build Status](https://travis-ci.org/theoricus/the-model.png?branch=master)](https://travis-ci.org/theoricus/the-model) [![Coverage Status](https://coveralls.io/repos/theoricus/the-model/badge.png)](https://coveralls.io/r/theoricus/the-model) [![Dependency Status](https://gemnasium.com/theoricus/the-model.png)](https://gemnasium.com/theoricus/the-model)

<!-- Uncomment this block after first public release in NPM
[![NPM version](https://badge.fury.io/js/theoricus.png)](http://badge.fury.io/js/theoricus)
-->

## Main concept

 1. Simple event dispatcher / listener
 2. Simple key-> value storage


```

# create an instance of pivot

Pivot = require 'app/components/events/pivot'

pivot = new Pivot



# Store and Retrieve a value

pivot.set 'name', 'foo'
pivot.get 'name' 			# should be foo



# Listening and unlistening to an event

set_name = ( name ) -> console.log "set_name is #{name}"

pivot.on 'changed:name', set_name

pivot.trigger 'changed:name', 'foo'

pivot.off 'changed:name', set_name



# Using binds

pivot.set 'name', 'hems'

set_name = ( name ) -> console.log "got name #{name}"

pivot.bind 'name', set_name # will trigger intantly and when this value change

pivot.set 'name', 'hems' # won't trigger cause its a repeated value

pivot.set 'name', 'david' # triggers!



##WIP



# Using the listener object itself

listener = pivot.on 'name', ( name )

set_name = ( name ) -> console.log "set_name is #{name}"

listener = pivot.on 'changed:name', set_name  # will set name to hems and propagate

listener.trigger 'foo'

listener.off()



# include / extend

```
#
