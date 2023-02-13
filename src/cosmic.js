const Color = cs.graphics.Color;

puts('Hello World!')

const w = cs.window.create(1200, 720, 'Demo')
w.onUpdate(g => {
    g.fontSize(52)
    g.fillColor(Color.blue);
    g.text(400, 300, 'Hello World!')
})

const b = cs.button.create(400, 400, 200, 100, 'Click Me')
b.onClick(() => {
    puts('Clicked!')
})