assert    = require 'assert'
Nightmare = require 'nightmare'

{ should } = require 'chai'
should()

addr = __dirname + "example/index.html"

describe "Check if ready for test", ->

  browser = undefined

  beforeEach ->
    browser = new Nightmare()
    yield browser.goto addr

  afterEach -> yield browser.end()

  it "should have Test as a title", ->
    title = yield browser.title()
    title.should.equal 'Test'

  it "should have an empty localStorage", ->
    empty = yield browser.evaluate ->
      localStorage.length is 0
    empty.should.equal yes
