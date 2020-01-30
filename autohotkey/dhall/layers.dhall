let Key = < A | B | C >

let Action = < CallFunction: Text | RawAction Text >

let Rule = {
  key: Key,
  action: Action
}

let Layer = { description : Text, key : Key, rules : List Rule }

in  42
