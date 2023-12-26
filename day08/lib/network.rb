class Network
  def initialize(lines)
    @nodes = {}
    lines.each do |line|
      match = /(...) = \((...), (...)\)/.match(line)
      @nodes[match[1]] = [match[2], match[3]]
    end
  end

  def starting_nodes
    @nodes.keys.select { |node| node.end_with?("A") }
  end

  def navigate(node, direction)
    @nodes[node][(direction == "L") ? 0 : 1]
  end
end
