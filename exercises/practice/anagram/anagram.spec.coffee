Anagram = require './anagram'
describe 'Anagram', ->
  it 'no matches', ->
    detector = new Anagram 'diaper'
    matches = detector.match ['hello', 'world', 'zombies', 'pants']
    expect(matches).toEqual []

  xit 'detects two anagrams', ->
    detector = new Anagram 'solemn'
    matches = detector.match ["lemons", "cherry", "melons"]
    expect(matches).toEqual ["lemons", "melons"]

  xit 'does not detect anagram subsets', ->
    detector = new Anagram 'good'
    matches = detector.match ["dog", "goody"]
    expect(matches).toEqual []

  xit 'detects anagram', ->
    detector = new Anagram 'listen'
    matches = detector.match ["enlists", "google", "inlets", "banana"]
    expect(matches).toEqual ["inlets"]

  xit 'detects three anagrams', ->
    detector = new Anagram 'allergy'
    matches = detector.match [
          "gallery",
          "ballerina",
          "regally",
          "clergy",
          "largely",
          "leading"
        ]
    expect(matches).toEqual ["gallery", "regally", "largely"]

  xit 'detects multiple anagrams with different case', ->
    detector = new Anagram 'nose'
    matches = detector.match ["Eons", "ONES"]
    expect(matches).toEqual ["Eons", "ONES"]

  xit 'does not detect non-anagrams with identical checksums', ->
    detector = new Anagram 'mass'
    matches = detector.match ['last']
    expect(matches).toEqual []

  xit 'detects anagrams case-insensitively', ->
    detector = new Anagram 'Orchestra'
    matches = detector.match ["cashregister", "Carthorse", "radishes"]
    expect(matches).toEqual ["Carthorse"]

  xit 'detects anagrams using case-insensitive subject"', ->
    detector = new Anagram 'Orchestra'
    matches = detector.match ["cashregister", "carthorse", "radishes"]
    expect(matches).toEqual ["carthorse"]

  xit 'detects anagrams using case-insensitive possible matches', ->
    detector = new Anagram 'Orchestra'
    matches = detector.match ['cashregister', 'Carthorse', 'radishes']
    expect(matches).toEqual ['Carthorse']

  xit 'does not detect an anagram if the original word is repeated', ->
    detector = new Anagram 'go'
    matches = detector.match ["goGoGO"]
    expect(matches).toEqual []

  xit 'anagrams must use all letters exactly once', ->
    detector = new Anagram 'tapper'
    matches = detector.match ["patter"]
    expect(matches).toEqual []

  xit 'words are not anagrams of themselve', ->
    detector = new Anagram 'BANANA'
    matches = detector.match ["BANANA"]
    expect(matches).toEqual []

  xit 'words are not anagrams of themselves even if letter case is partially different', ->
    detector = new Anagram 'BANANA'
    matches = detector.match ["Banana"]
    expect(matches).toEqual []

  xit 'words are not anagrams of themselves even if letter case is completely different', ->
    detector = new Anagram 'BANANA'
    matches = detector.match ["banana"]
    expect(matches).toEqual []

  xit 'words other than themselves can be anagrams', ->
    detector = new Anagram 'LISTEN'
    matches = detector.match ["LISTEN", "Silent"]
    expect(matches).toEqual ["Silent"]
