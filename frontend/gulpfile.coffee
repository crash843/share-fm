gulp = require 'gulp'
browserify = require 'gulp-browserify'
rename = require 'gulp-rename'
sass = require 'gulp-ruby-sass'
sourcemaps = require 'gulp-sourcemaps'
reactify = require 'reactify'
uglify = require 'gulp-uglify'
coffeelint = require 'gulp-coffeelint'

gulp.task 'coffee', ->
    gulp.src 'src/coffee/app.coffee', { read: false }
        .pipe browserify {
            transform: ['coffee-reactify'],
            extensions: ['.coffee'],
            # debug : true,
        }
        .pipe rename 'index.js'
        .pipe gulp.dest './build/js'

gulp.task 'sass', ->
    gulp.src 'src/scss/main.scss'
        .pipe sass {
            style : 'compressed',
            # sourcemap: 'inline',
            compass : true
        }
        .on 'error', (err) ->
            console.log err.message
        .pipe gulp.dest './build/css'

gulp.task 'compress', ->
    gulp.src 'build/js/*.js'
        .pipe uglify()
        .pipe rename 'index.min.js'
        .pipe gulp.dest './build/js'

gulp.task 'lint', ->
    gulp.src 'src/**/*.coffee'
        .pipe coffeelint()
        .pipe coffeelint.reporter()

gulp.task 'watch', ->
    gulp.watch 'src/coffee/**/*.coffee', ['lint', 'coffee']
    gulp.watch 'src/scss/**/*.scss', ['sass']

gulp.task 'img', ->
    gulp.src 'src/img/*'
        .pipe gulp.dest './build/img'

gulp.task 'html', ->
    gulp.src 'src/*.html'
        .pipe gulp.dest './build'

gulp.task 'default', ['coffee', 'img', 'sass', 'compress', 'html']
