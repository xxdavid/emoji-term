#!/usr/bin/env ruby

puts "Okay, let's make your terminal a bit more hipsta.\n\n"

bin_dir = (`pwd`.delete!("\n") + "/bin")
Dir.mkdir(bin_dir) unless File.exists?(bin_dir)

emojis = [
    # System
    ["bless", "🙌"],
    ["cal", "📅"],
    ["cat", "🐈"],
    ["cd", "💿"],
    ["chat", "💬"],
    ["clear", "🆑"],
    ["date", "💑"],
    ["exit", "🚪"],
    ["fax", "📠"],
    ["find", "🔍"],
    ["finger", "🖕"],
    ["fold", "🙏"],
    ["free", "🆓"],
    ["grep", "🍇", "--color=auto"],
    ["groups", "👪"],
    ["head", "🤕"],
    ["kill", "🗡"],
    ["locate", "📍"],
    ["look", "👀"],
    ["login", "🔑"],
    ["mail", "📬"],
    ["man", "👨"],
    ["mount", "⛰"],
    ["open", "🔓"],
    ["ping", "🏓"],
    ["port", "🚢"],
    ["puma", "😾"],
    ["read", "📖"],
    ["rm", "💩"],
    ["say", "👄"],
    ["screen", "📺"],
    ["shift", "🔄"],
    ["size", "📏"],
    ["sleep", "💤"],
    ["swift", "🏃"],
    ["tie", "👔"],
    ["time", "⏰"],
    ["toe", "👣"],
    ["top", "🔝"],
    ["touch", "👉"],
    ["units", "📐"],
    ["wait", "⏱"],
    ["wc", "🚽"],
    ["what", "🤔"],
    ["whoami", "🤷"],
    ["yes", "👍"],
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
    ["spring", "♨️"],
    ["unicorn", "🦄"],
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

