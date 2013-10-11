should = do (require 'chai').should
coffee = require 'coffee-script'
Pivot = require '../../src/index'

class TestClass
  param_1         : "one"
  param_2         : "two"
  instance_method : ( ) ->
  @class_method   : ( ) ->


count_attributes = ( obj ) ->
  count = 0
  for k of obj
    count++

  return count


exports.test = ( pivot ) ->

  foofunk  = ->
  listener = {}

  describe '[key-> value storage]', ->

    it 'it should store a value', (done)->

        pivot.set 'key', 'value'
        done()

    it 'it should retrieve a value', (done)->

        (pivot.get 'key').should.equal 'value'

        done()

  describe '[event system]', ->

    it 'it should register an event', (done) ->

        pivot.on 'event', ->
        done()

    it 'it should propagate an event', (done)->

        pivot.on 'changed:name', foofunk
        pivot.on 'changed:name', -> done()

        pivot.trigger 'changed:name', 'foo'

    it 'it should unregister event', (done)->

        pivot.off( 'changed:name', foofunk ).should.equal true

        done()


  describe '[include/extend]', ->

    it 'it should create a TestClass instance', (done) ->
        instance = new TestClass
        instance.param_1.should.equal "one"

        done()


    it 'it should include Pivot instance methods in a TestClass instance', (done)->
        instance = new TestClass
        attr_instance = count_attributes instance
        
        Pivot.include TestClass

        instance_2 = new TestClass
        attr_instance_2 = count_attributes instance_2

        attr_instance_2.should.equal attr_instance + count_attributes( pivot )

        done()

    it 'it should extend Pivot class methods with TestClass class methods', (done)->
        pivot_count = count_attributes Pivot
        test_count = count_attributes TestClass

        Pivot.extend TestClass

        new_pivot_count = count_attributes Pivot

        new_pivot_count.should.equal pivot_count + test_count

        done()




