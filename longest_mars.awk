BEGIN {
    FS=" *\\| *"
    max_duration = -1
}
$0 !~ /^#/ && NF >= 8 && $3 == "Mars" && $4 == "Completed" {
    duration = $6 + 0
    if (duration > max_duration) {
        max_duration = duration
        security_code = $8
    }
}
END {
    print security_code
}