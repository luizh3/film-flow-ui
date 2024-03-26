import QtQuick 2.15

import FFTheme 1.0

LoadingForm {
    id: root

    readonly property int lineWidth: 8

    readonly property color primaryColor: FFColor.orange
    readonly property color secondaryColor: FFColor.secundary
    readonly property real degree: 100

    readonly property int size: 75

    canvas.onPaint: {
        var ctx = canvas.getContext("2d")

        var x = root.width / 2
        var y = root.height / 2

        var radius = 75 / 2 - root.lineWidth
        var startAngle = (Math.PI / 180) * 270
        var fullAngle = (Math.PI / 180) * (270 + 360)
        var runningAngle = (Math.PI / 180) * (270 + root.degree)

        ctx.reset()

        ctx.lineCap = 'round'
        ctx.lineWidth = root.lineWidth

        ctx.beginPath()
        ctx.arc(x, y, radius, startAngle, fullAngle)
        ctx.strokeStyle = root.secondaryColor
        ctx.stroke()

        ctx.beginPath()
        ctx.arc(x, y, radius, startAngle, runningAngle)
        ctx.strokeStyle = root.primaryColor
        ctx.stroke()
    }

    canvas {
        RotationAnimator on rotation {
            running: true
            loops: Animation.Infinite
            from: 0
            to: 360
            duration: 1500
        }
    }
}
