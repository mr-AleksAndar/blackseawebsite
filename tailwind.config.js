module.exports = {
  mode: 'jit',
  purge: ['./app/**/*.{html,erb,js}'],
  content: [
    './app/views/**/*.html.erb',    // For ERB views in Rails
    './app/helpers/**/*.rb',        // For helpers
    './app/javascript/**/*.js',     // For JavaScript files
    './app/assets/stylesheets/**/*.css', // For any additional CSS files
  ],
  theme: {
    extend: {
      height: {
        '500': '500px',
        '600': '600px',
        '700': '700px',
        '900': '900px',
      }, 
      screens: {
        '3xl': '2200px',  // Custom 3xl breakpoint
      },
    },
  },
  plugins: [],
}