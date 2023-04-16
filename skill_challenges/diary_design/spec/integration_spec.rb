# Diary
  # When set up
    # Provides an empty list of phone numbers
    # Provides an empty list of diary entries
    # Fails to get longest possible entry
    # Has a list of todos
      # Complete == [], Incomplete == [], all == []
  # When provided with multiple entries
    # provides a list of them
    # #get_longest_possible
      # Fails to get longest possible entry when none are short enough
      # When there is an entry exactly the right length, it will return that as the longest possible entry
      # When there is a selection of longer and shorter entries, it will return the longest that is possible to read
    # #all_phone_numbers
      # Returns empty list when entries don't have phone numbers
      # Returns all phone numbers when entries have one or more phone numbers
  # When todos are added
    # #todos returns all of them
    # #todos(status = 'complete') returns completed todos
    # #todos(status = 'incomplete') returns incomplete todos