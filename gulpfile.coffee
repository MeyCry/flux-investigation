gulp = require("gulp")
reactify = require("reactify")
browserify = require("gulp-browserify")
concat = require("gulp-concat")

gulp.task "browserify", ->
  gulp.src "src/js/main.js"
    .pipe browserify
      transform: reactify
    .pipe concat("main.js")
    .pipe gulp.dest "dist/js"

gulp.task "copy", ->
  gulp.src "src/index.html"
    .pipe(gulp.dest("./dist"))


gulp.task "default", ["browserify", "copy"]

gulp.task "w", ->
  gulp.watch("src/**/*.js", ["browserify"])
  gulp.watch("src/**/*.html", ["copy"])