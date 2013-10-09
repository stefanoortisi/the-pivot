# The Pivot

Simple event system and key->value storage


[![Build Status](https://travis-ci.org/theoricus/the-model.png?branch=master)](https://travis-ci.org/theoricus/the-model) [![Coverage Status](https://coveralls.io/repos/theoricus/the-model/badge.png)](https://coveralls.io/r/theoricus/the-model) [![Dependency Status](https://gemnasium.com/theoricus/the-model.png)](https://gemnasium.com/theoricus/the-model)

<!-- Uncomment this block after first public release in NPM
[![NPM version](https://badge.fury.io/js/theoricus.png)](http://badge.fury.io/js/theoricus)
-->

## Main concept

 1. Simple event dispatcher / listener
 2. Simple key-> value storage


#
### Propagating events, storing and retrieving data
#

```
Pivot = require 'app/components/events/pivot'

pivot = new Pivot

listener = pivot.on 'name', ( name ) -> console.log name

pivot.set 'name', 'hems'      # will set name to hems and propagate

pivot.set 'name', 'david'     # will set name to david and propagate

pivot.set 'name', 'david'     # won't propgate since the value is the same as the value stored

pivot.trigger 'name', 'david' # trigger will propgate regardless of being the same value as stored

pivot.get 'name'              # returns last stored stored/propagated value for this event

console.log listener.value    # return last propagated value from this listener

listener.set 'hems'           # set value for key "name", therefore propagating this value again

listener.off()                # will unregister the event

listener.set 'david'          # the event wont receive the call

listener.on()                 # will register the event again

listener.set 'stefano'        # event will receive the call
```

#
### using binds
#

```
pivot.set 'name', 'hems'

set_name = ( name ) -> console.log "got name #{name}"

pivot.bind 'name', set_name # will trigger intantly and when this value change

pivot.set 'name', 'hems' # won't trigger cause its a repeated value

pivot.set 'name', 'david' # triggers!
```

#
### include / extend
#
