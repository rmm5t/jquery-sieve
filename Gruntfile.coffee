module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    # Metadata.
    pkg: grunt.file.readJSON('sieve.jquery.json')
    basename: 'jquery.<%= pkg.name %>'
    headline: '<%= pkg.title || pkg.name %> v<%= pkg.version %>'
    copyright: '<%= grunt.template.today("yyyy") %> <%= pkg.author.name %>'
    licenses: '<%= _.pluck(pkg.licenses, "type").join(", ") %>'
    banner: '''
      /*!
       * <%= headline %> (<%= grunt.template.today("yyyy-mm-dd") %>)
       * <%= pkg.homepage %>
       * Copyright (c) <%= copyright %>; Licensed <%= licenses %>
       */

    '''
    # Task configuration.
    clean:
      files: ['dist', 'test/compiled']

    coffee:
      compile:
        src: 'src/**/*.coffee'
        dest: 'dist/<%= basename %>.js'
      test:
        src: 'test/sieve_test.coffee'
        dest: 'test/compiled/sieve_test.js'

    uglify:
      dist:
        src: '<%= coffee.compile.dest %>'
        dest: 'dist/<%= basename %>.min.js'

    concat:
      options:
        banner: '<%= banner %>'
        stripBanners: true
      dist:
        files:
          '<%= coffee.compile.dest %>': ['<%= coffee.compile.dest %>']
          '<%= uglify.dist.dest %>': ['<%= uglify.dist.dest %>']

    qunit:
      files: ['test/**/*.html']

    watch:
      src:
        files: '<%= coffee.compile.src %>'
        tasks: ['compile', 'qunit']
      test:
        files: '<%= coffee.test.src %>'
        tasks: ['coffee:test', 'qunit']

    replace:
      site:
        src: ['index.html']
        overwrite: true
        replacements: [
          { from: /v[0-9]+\.[0-9]+\.[0-9]+/g, to: 'v<%= pkg.version %>' }
        ]

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-qunit')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-text-replace')

  grunt.registerTask('compile', ['coffee', 'uglify', 'concat'])
  grunt.registerTask('build', ['compile', 'replace'])
  grunt.registerTask('test', ['qunit'])
  grunt.registerTask('default', ['clean', 'build', 'test'])
