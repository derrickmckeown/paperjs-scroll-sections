module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    concat:
      options:
        separator: ";"

      dist:
        src: [
          "js/lib/jquery-2.0.1.js",
          "js/lib/jq-events.js",
          "js/lib/jquery.mousewheel.js",
          "js/lib/tween.min.js",
          "js/lib/dat.gui.min.js",
          "js/lib/paper.js"
        ]
        dest: "dist/<%= pkg.name %>.js"

    uglify:
      options:
        banner: "/*! <%= pkg.name %> <%= grunt.template.today(\"dd-mm-yyyy\") %> */\n"

      dist:
        files:
          "dist/<%= pkg.name %>.min.js": ["<%= concat.dist.dest %>"]

    watch:
      files: ["<%= jshint.files %>"]
      tasks: ["concat", "uglify"]

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.registerTask "default", ["concat", "uglify"]