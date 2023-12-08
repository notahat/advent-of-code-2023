import extractNumbersFromLine from "./extract_numbers_from_line"

describe(".extractNumbersFromLine", () => {
  test("strips numbers out of a line", () => {
    expect(extractNumbersFromLine("..123..456..")).toEqual([
      { index: 2, length: 3, value: 123 },
      { index: 7, length: 3, value: 456 },
    ])
  })
})
