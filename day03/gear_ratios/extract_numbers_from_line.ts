interface MatchedNumber {
  index: number
  length: number
  value: number
}

export default function extractNumbersFromLine(line: string): MatchedNumber[] {
  return Array.from(line.matchAll(/\d+/g), (match) => {
    return {
      index: match.index || 0,
      length: match[0].length,
      value: Number(match[0]),
    }
  })
}
