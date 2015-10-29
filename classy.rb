#!/usr/bin/ruby

###############################################################
### Copyright 2015 by Santiago Gonzalez <slgonzalez@me.com> ###
###############################################################

require 'colorize'


def usage
  puts "Usage: classy directory"
  puts "       classy directory ClassName"
end


def recurse_insert_the_tree(tree, item)
  # check if in this layer
  tree.keys.each do |key|
    if key == item[3]
      tree[key][4][item[1]] = item
      return true
    end
  end
  
  # check if in subtrees
  tree.values.each do |entry|
    if recurse_insert_the_tree(entry[4], item)
      return true
    end
  end
  
  # failure
  return false
end

def find_node_named(tree, name)
  # check if in this layer
  tree.keys.each do |key|
    if key == name
      return tree[name]
    end
  end
  
  # check if in subtrees
  tree.values.each do |entry|
    return find_node_named(entry[4], name)
  end
  
  # failure
  return false
end


$tree_print_scopes = {}
def print_tree(root, indentation = 0, is_last = false)
  if !$tree_print_scopes.key? indentation
    $tree_print_scopes[indentation] = true
  end
  
  (indentation-1).times do |i|
    if $tree_print_scopes[i] == true
      print " │   "
    else
      print "     "
    end
  end
  
  if indentation != 0
    if is_last
      print " └── "
    else
      print " ├── "
    end
  end
  
  print root[1]
  print " #{root[0]}".cyan
  print " #{root[2]}".blue
  print " #{root[5]}".magenta
  print "\n"
  
  root[4].values.each_with_index do |child, i|
    is_last = (i == root[4].values.size-1)
    if is_last
      $tree_print_scopes[indentation] = false
    else
      $tree_print_scopes[indentation] = true
    end
    print_tree(child, indentation+1, is_last)
  end
end


################
## Control start

if ARGV.size != 1 && ARGV.size != 2
  usage
  exit
end
target_dir = ARGV[0]
explicit_root = ""
if ARGV.size == 2
  explicit_root = ARGV[1]
end

roots = {}
children = []

filenames = Dir.glob("#{target_dir}/**/*.h") + Dir.glob("#{target_dir}/**/*.hpp")
filenames.each do |filename|
  contents = File.open(filename, 'rb') { |f| f.read }
  captures = contents.scan(/^(class|struct) (\w+)(\s?:\s?(public|private)?\s?(\w+))?\s?{/)
  captures.each do |capture|
    type = capture[0]
    name = capture[1]
    inheritance = capture[3]
    parent = capture[4]
    
    if !capture[4] # root class
      roots[name] = [type, name, inheritance, parent, {}, File.basename(filename)]
      # puts "ROOT: #{name}"
    else # child class
      children << [type, name, inheritance, parent, {}, File.basename(filename)]
      # puts "CHILD: #{name}       #{parent}"
    end
  end
end

loop do
  children.each do |child|
    if recurse_insert_the_tree(roots, child)
      children.delete child
      break
    end
  end
    
  break if children.size == 0
end

if explicit_root.empty? # no explicit root specified, print everything
  roots.values.each do |root|
    print_tree root
  end
else # print tree for explicit root
  result = find_node_named(roots, explicit_root)
  if result
    print_tree(result)
  else
    puts "No tree available"
  end
end



