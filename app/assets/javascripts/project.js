// We have to make sure turbolinks is loaded before we work our magic
document.addEventListener('turbolinks:load', function () {
  // Assign the elements we're intrerested in to variables
  const openProjectButton = document.getElementById('new-project-button')
  const projectPopover = document.getElementById('new-project-popover')
  const projectForm = document.getElementById('new-project-form')
  const projectName = document.getElementById('project-name-input')

  // Let's check to see if these elements exist before we add our listeners
  if (openProjectButton && projectPopover) {
    // Attach an event listener to our new project button
    openProjectButton.addEventListener('click', function () {
      // If the project popovers class list contains the 'is-hidden' class, remove it
      // otherwise don't do anything!
      return projectPopover.classList.contains('is-hidden') ? projectPopover.classList.remove('is-hidden') : null
    }, false)

    // Attach an event listener to our cancel button
    const cancelProjectPopover = document.getElementById('cancel-project-popover')
    cancelProjectPopover.addEventListener('click', function () {
      // We can safely assume that if our user can see the Cancel button, then the 
      // .is-hidden class is not part of the class list of project pop-over and we can
      // remove it.
      return projectPopover.classList.add('is-hidden')
    }, false)
  }

  // Handle errors from the project form submission
  projectForm.addEventListener('ajax:error', function (xhr, status, err) {
    // Have a good look at what's returned with a console.log()
    console.log(xhr)

    // Add an error class to the project name input
    projectName.classList.add('is-invalid')

    // Create and add our error helper
    var errorNode = document.createElement('div')
    var errorTextNode = document.createTextNode('Name must not be blank')
    errorNode.classList.add('invalid-feedback')
    errorNode.appendChild(errorTextNode)
    projectName.parentNode.insertBefore(errorNode, projectName.nextSibling)
  })
})
