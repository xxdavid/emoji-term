#!/usr/bin/env ruby

puts "Okay, let's make your terminal a bit more hipsta.\n\n"

bin_dir = (`pwd`.delete!("\n") + "/bin")
Dir.mkdir(bin_dir) unless File.exists?(bin_dir)

emojis = [
    # System
    ["cal", "📅"],
    ["cat", "🐈"],
    ["chat", "💬"],
    ["clear", "🆑"],
    ["fax", "📠"],
    ["find", "🔍"],
    ["finger", "🖕"],
    ["fold", "🙏"],
    ["grep", "🍇", "--color=auto"],
    ["groups", "👪"],
    ["head", "🤕"],
    ["kill", "🗡"],
    ["locate", "📍"],
    ["look", "👀"],
    ["mail", "📬"],
    ["man", "👨"],
    ["mount", "⛰"],
    ["port", "🚢"],
    ["puma", "😾"],
    ["rm", "💩"],
    ["say", "👄"],
    ["shift", "🔄"],
    ["size", "📏"],
    ["swift", "🏃"],
    ["tie", "👔"],
    ["time", "⏰"],
    ["toe", "👣"],
    ["top", "🔝"],
    ["touch", "👉"],
    ["units", "📐"],
    ["wait", "⏱"],
    ["what", "🤔"],
    ["zip", "🤐"],

    # User
    ["atom", "⚛"],
    ["brew", "🍺"],
    ["grunt", "🐗"],
    ["java", "☕"],
    ["psql", "🐘"],
    ["python", "🐍"],
    ["rails", "🛤"],
    ["ruby", "💎"],
]

emojis.each do | item |
    found = (`which #{item[0]}` != "")
    if found
        file_path = "#{bin_dir}/#{item[1]}"
        File.open(file_path, 'w') do | file |
            file.write(
                "#!/usr/bin/env bash\n\n" +
                "#{item[0]} \"$@\" #{item[2]}\n"
            )

            `chmod +x #{file_path}`
            puts "#{item[1]}  mapped to #{item[0]}"
        end
    end
end

puts "\nDone."
puts "The last step is to add #{bin_dir} to your $PATH."

