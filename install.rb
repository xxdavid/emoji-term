#!/usr/bin/env ruby

puts "Okay, let's make your terminal a bit more hipsta.\n\n"

bin_dir = (`pwd`.delete!("\n") + "/bin")
Dir.mkdir(bin_dir) unless File.exists?(bin_dir)

emojis = [
    # System
    ["cat", "🐈"],
    ["cal", "📅"],
    ["finger", "🖕"],
    ["man", "👨"],
    ["say", "👄"],
    ["top", "🔝"],
    ["touch", "👉"],
    ["units", "📐"],
    ["zip", "🤐"],


    # User
    ["atom", "⚛"],
    ["brew", "🍺"],
    ["grunt", "🐗"],
    ["java", "☕"],
    ["ruby", "💎"],
    ["rails", "🛤"],
    ["psql", "🐘"],
]

emojis.each do | item |
    found = (`which #{item[0]}` != "")
    if found
        file_path = "#{bin_dir}/#{item[1]}"
        File.open(file_path, 'w') do | file |
            file.write(
                "#!/usr/bin/env bash\n\n" +
                "#{item[0]} \"$@\"\n"
            )

            `chmod +x #{file_path}`
            puts "#{item[1]}  mapped to #{item[0]}"
        end
    end
end

puts "\nDone."
puts "The last step is to add #{bin_dir} to your $PATH."

