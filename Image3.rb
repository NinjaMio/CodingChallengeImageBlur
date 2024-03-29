class Image

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |row|
      puts row.join("")
    end
  end

  def blur(distance)
    h = @data.length
    w = @data.first.length
    blurred = Array.new(h, 0){Array.new(w, 0)}

    @data.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        if cell == 1 then
          blurred[i][j] = 1
          blur_helper(distance, i, j, blurred)
        end
      end
    end
    return blurred
  end

  def blur_helper(d, i, j, image)
    h = image.length
    w = image.first.length
    if d == 0 then
      return
    else
      if i == 0 then
        image[1][j] = 1
        blur_helper(d-1, 1, j, image)
      elsif i == h-1 then
        image[h-2][j] = 1
        blur_helper(d-1, h-2, j, image)
      else
        image[i-1][j] = 1
        blur_helper(d-1, i-1, j, image)
        image[i+1][j] = 1
        blur_helper(d-1, i+1, j, image)
      end

      if j == 0 then
        image[i][1] = 1
        blur_helper(d-1, i, 1, image)
      elsif j == w-1 then
        image[i][w-2] = 1
        blur_helper(d-1, i, w-2, image)
      else
        image[i][j-1] = 1
        blur_helper(d-1, i, j-1, image)
        image[i][j+1] = 1
        blur_helper(d-1, i, j+1, image)
      end
      
    end
  end
end

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 1]
])

blurred_data = image.blur(3)
blurred_img = Image.new(blurred_data)

image.output_image
puts "---------"
blurred_img.output_image