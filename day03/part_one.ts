import fs from "node:fs"
import iterateInThrees from "./gear_ratios/iterate_in_threes"
import extractNumbersFromLine from "./gear_ratios/extract_numbers_from_line"

const lines = fs.readFileSync("input.txt", "utf-8").split("\n")
const result = partNumbersFromFile(lines).reduce((a, b) => a + b)
console.log(result)

function partNumbersFromFile(lines: string[]) {
  return Array.from(iterateInThrees(lines)).flatMap((lines) =>
    partNumbersFromSurroundingLines(lines),
  )
}

function partNumbersFromSurroundingLines(lines: string[]): number[] {
  return extractNumbersFromLine(lines[1])
    .filter((partNumber) =>
      surroundingLinesHaveSymbolAdjacentToNumber(
        lines,
        partNumber.index,
        partNumber.length,
      ),
    )
    .map((partNumber) => partNumber.value)
}

function surroundingLinesHaveSymbolAdjacentToNumber(
  lines: string[],
  index: number,
  length: number,
): boolean {
  return lines.some((line) =>
    lineHasSymbolAdjacentToNumber(line, index, length),
  )
}

function lineHasSymbolAdjacentToNumber(
  line: string,
  index: number,
  length: number,
): boolean {
  const s = line.substring(index - 1, index + length + 1)
  return /[^.\d]/.test(s)
}
