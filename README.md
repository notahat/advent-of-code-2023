# Advent of Code 2023

## Day 1: Trebuchet?!

Quickly hacked up in Ruby, just to get my eye in.

## Day 2: Cube Conundrum

Still Ruby, a little more rigorous, with a Rakefile to run everything.

## Day 3: Gear Ratios

This one was harder than I thought!

In particular, the second part was a big departure from the first. In part one,
I looked for numbers, and then checked for adjacent symbols. But, in part two,
I had to look for symbols and then find adjacent numbers. I'm not sure there
was any way around this.

I thought I'd try this one in Typescript, and then spent ages trying to
convince tsx, jest, prettier, and eslin to all play nicely. I think I'll go
back to Ruby for the next one.

## Day 4: Scratchcards

This one was easier.

I thought I'd try out sorbet with Ruby this time. Wasn't really worth it. I
spent a bunch of time arguing with sorbet, and didn't win. For this sort of
problem where we're only dealing with well-formed input, strict types don't
help that much.

### Day 5: If You Give A Seed A Fertilizer

Plain old Ruby for this one.

Part 1 was easy, but part 2 was much harder. I had to figure out a way to
efficiently compose all the maps to make the computation take a reasonable
amount of time. I'm not sure if there's a simpler approach.

### Day 6: Wait For It

Got this one super quick! Realised that you could boil this down to finding the
roots of a quadratic equation, and did that straight away for part one. The
same approach worked for part 2, so it fell out in a couple of minutes.

### Day 7: Camel Cards

This was a good one to roughly TDD. Part one was straightforward, although I
made a couple of simple mistakes that meant I submitted some wrong answers.

Part two was easy once I figured out you just had to identify the most common
card in the hand, and make the wildcards match that.

### Day 8: Haunted Wasteland

This one was fun! I started out trying to bruteforce part 2, but gave up after
running it for a while. The problem hinted that the answer would be really big.

Once I looked at the data it was straightforward. From each starting node, you
get a regularly repeating cycle. Once you know how long these cycles are, you
can find the least common multiple of them to get the answer.

This is slightly dissatisfiying, as it's not a general solution to the problem.
Input data that didn't have these straightfroward would be much harder.
