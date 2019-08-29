class Image

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |row|
      puts row.join("")
    end
  end

  def blur
    h = @data.length
    w = @data.first.length
    blurred = Array.new(h, 0){Array.new(w, 0)}
    # blurred = @data.dup

    @data.each_with_index do |row, i|
      row.each_with_index do |point, j|
        if point == 1 then        # i, j is 1 in @data
          blurred[i][j] = 1       # setting i, j to 1 in blurred
          if i == 0 then
            blurred[1][j] = 1
          elsif i == h-1 then
            blurred[h-2][j] = 1
          else
            blurred[i-1][j] = 1
            blurred[i+1][j] = 1
          end

          if j == 0 then
            blurred[i][1] = 1
          elsif j == w-1 then
            blurred[i][w-2] = 1
          else
            blurred[i][j-1] = 1
            blurred[i][j+1] = 1
          end
        end
      end
    end

    return blurred
  end
end

image = Image.new([
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 1],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 1]
])

blurred_data = image.blur
blurred_img = Image.new(blurred_data)

image.output_image
puts "---------"
blurred_img.output_image