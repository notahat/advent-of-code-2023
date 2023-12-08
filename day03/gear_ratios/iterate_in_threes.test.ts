import iterateInThrees from "./iterate_in_threes"

describe(".iterateInThrees", () => {
  test("iterates over an arryay in groups of three", () => {
    const lines = ["a", "b", "c"]
    const inThrees = iterateInThrees(lines)
    expect([...inThrees]).toEqual([
      ["", "a", "b"],
      ["a", "b", "c"],
      ["b", "c", ""],
    ])
  })
})
