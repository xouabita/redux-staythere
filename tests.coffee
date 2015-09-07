assert    = require 'assert'
Nightmare = require 'nightmare'

{ should } = require 'chai'
should()

addr = "file://" + __dirname + "/example/index.html"

describe "Check if ready for test", ->

  browser  = undefined

  beforeEach ->
    browser = Nightmare()
    yield browser.goto addr

  afterEach -> yield browser.end()

  it "should have Test as a title", ->
    title = yield browser.title()
    title.should.equal 'Test'

  it "should have an empty localStorage", ->
    empty = yield browser.evaluate ->
      localStorage.length is 0
    empty.should.equal yes

describe "test the storage", ->

  browser = undefined

  before ->
    browser = new Nightmare()
    yield browser.goto addr

  after -> yield browser.end()

  getValue = ->
    value = yield browser.evaluate ->
      document.getElementById('value').textContent
    return value

  inc = -> yield browser.click '#plus'

  dec = -> yield browser.click '#minus'

  it "increment the counter", ->
    yield inc()
    value = yield getValue()
    value.should.equal "1"

  it "decrement the counter", ->
    yield dec()
    yield dec()
    value = yield getValue()
    value.should.equal "-1"

  it "should save the value with refresh", ->
    yield inc()
    value = yield getValue()
    value.should.equal "0"
    for i in [0...42]
      yield inc()
    value = yield getValue()
    value.should.equal "42"
    yield browser.refresh()
    value = yield getValue()
    value.should.equal "42"
