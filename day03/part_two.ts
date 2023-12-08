import fs from "node:fs"
import iterateInThrees from "./gear_ratios/iterate_in_threes"
import extractNumbersFromLine from "./gear_ratios/extract_numbers_from_line"

const lines = fs.readFileSync("input.txt", "utf-8").split("\n")
const result = gearRatiosFromFile(lines).reduce((a, b) => a + b)
console.log(result)

export function gearRatiosFromFile(lines: string[]): number[] {
  return Array.from(iterateInThrees(lines)).flatMap(
    gearRatiosFromSurroundingLines,
  )
}

function gearRatiosFromSurroundingLines(lines: string[]): number[] {
  return indexesOfGearsInLine(lines[1])
    .map((gearIndex) =>
      numbersAdjacentToGearInSurroundingLines(lines, gearIndex),
    )
    .filter((numbers) => numbers.length == 2)
    .map((numbers) => numbers[0] * numbers[1])
}

function indexesOfGearsInLine(line: string): number[] {
  return Array.from(line.matchAll(/\*/g), (match) => match.index).filter(
    (index) => index,
  ) as Array<number>
}

function numbersAdjacentToGearInSurroundingLines(
  lines: string[],
  gearIndex: number,
): number[] {
  return lines.flatMap((line) => numbersAdjacentToGearInLine(line, gearIndex))
}

function numbersAdjacentToGearInLine(
  line: string,
  gearIndex: number,
): number[] {
  return extractNumbersFromLine(line)
    .filter(
      (number) =>
        number.index >= gearIndex - number.length &&
        number.index <= gearIndex + 1,
    )
    .map((number) => number.value)
}
