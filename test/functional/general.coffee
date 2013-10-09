should = do (require 'chai').should
coffee = require 'coffee-script'

exports.test = ( pivot ) ->

  describe '[general]', ->

    describe '[key-> value storage]', ->

      it 'it should store a value', (done)->

          pivot.set 'key', 'value'

          done()

      it 'it should retrieve a value', (done)->

          (pivot.get 'key').should.equal 'value'

          done()

    # describe '[event system]', ->

    #   it 'i should write this test', (done)->
    #       # should.not.exist err
    #       done()



    # describe '[include/extend]', ->

    #   it 'i should write this test', (done)->
    #       # should.not.exist err
    #       done()