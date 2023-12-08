export default function* iterateInThrees(lines: string[]) {
  for (let index = 0; index < lines.length; index++) {
    yield [
      index >= 1 ? lines[index - 1] : "",
      lines[index],
      index < lines.length - 1 ? lines[index + 1] : "",
    ]
  }
}
