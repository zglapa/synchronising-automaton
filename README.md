# synchronising-automaton
A haskell program for finding the shortest synchronising word for DFA developed for Functional Programming Course 2022/2023 at Jagiellonian University in Krakow
# Building and running
To build & run on a data file type
```
cabal run synchronising-automaton -- [file]
```

# Important notes
The program functions under certain assumptions
- Automaton has states of the type `Int`
- Automaton is a complete DFA i.e. every state has exactly one outbound transition for every symbol in the alphabet
- Input file format is of the type
    ``` 
    -- [Header]
    [States]
    [Alphabet]
    --
    [Transition 1]
    [Transition 2]
    .
    .
    .
    [Transition n]
    --
    [Start state]
    [End states]
    ```
