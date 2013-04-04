module.exports = (grunt) ->
  pkgFile = 'sieve.jquery.json'
  pkg = grunt.file.readJSON pkgFile

  # Project configuration.
  grunt.initConfig
    # Metadata.
    pkg: pkg
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
        src: 'test/*.coffee'
        dest: 'test/compiled/test.js'

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
          { from: /v[0-9]+\.[0-9]+\.[0-9]+(-\w+)?/g, to: 'v<%= pkg.version %>' }
        ]

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-text-replace'

  grunt.registerTask 'compile', ['coffee', 'uglify', 'concat']
  grunt.registerTask 'build', ['compile', 'replace']
  grunt.registerTask 'test', ['qunit']
  grunt.registerTask 'default', ['clean', 'build', 'test']

  grunt.registerTask 'bump', 'Bump, build, and commit the next version.', (type) ->
    oldVersion = pkg.version
    pkg.version = versionBump(oldVersion, type)
    grunt.log.write('Bumping version to ' + pkg.version);
    grunt.file.write(pkgFile, JSON.stringify(pkg, null, '  ') + '\n')
    grunt.log.ok()
    grunt.task.run('default', 'commitBump');

  grunt.registerTask "commitBump", 'Add and commit all bumped version changes.', ->
    run "git add ."
    run "git commit -m 'Bumped version to v#{pkg.version}'"
    grunt.log.subhead("DON'T FORGET TO `grunt release`")

  grunt.registerTask 'release', ['tag', 'push', 'publish']

  grunt.registerTask 'tag', "Tag a new release", ->
    version = grunt.config("pkg.version")
    run "git checkout master"
    run "git tag v#{version}"

  grunt.registerTask 'push', "Push tags", ->
    run "git push origin master:master"
    run "git push --tags"

  grunt.registerTask 'publish', "Publish docs for the current release", ->
    run "git push origin master:gh-pages"

  shell = require 'shelljs'
  run = (command) ->
    grunt.log.write "Running `#{command}`..."
    p = shell.exec(command, silent: true)
    if p.code == 0
      grunt.log.ok()
    else
      grunt.log.error()
      grunt.log.error(p.output)
      grunt.warn "Non-zero exit code for `#{command}`."

  versionBump = (version, versionType) ->
    type = major: 0, minor: 1, patch: 2
    parts = version.split('.')
    idx = type[versionType || 'patch']

    parts[idx] = parseInt(parts[idx], 10) + 1
    while ++idx < parts.length
      parts[idx] = 0
    return parts.join('.')
