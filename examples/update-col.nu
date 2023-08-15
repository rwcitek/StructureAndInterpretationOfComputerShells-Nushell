# update-col.nu using update whith record
let x = { foo: 0, bar: 1, baz: 2 }
$x | update bar {|i| $i.bar + 99 }
