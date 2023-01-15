module ExampleAutomata (
  dfa_even_a
) where

import DFA

-- Simple DFA that accepts the language {w in {a,b}* | w contains even number of a's}
-- e.g. "abba" is accepted, "ababa" is not
dfa_even_a :: DFA Int
dfa_even_a = DFA {
    states = [State 0, State 1],
    alphabet = ['a', 'b'],
    transitions = [
        (State 0, 'a', State 1),
        (State 0, 'b', State 0),
        (State 1, 'a', State 0),
        (State 1, 'b', State 1)
    ],
    startState = State 0,
    endStates = [State 0]
}
