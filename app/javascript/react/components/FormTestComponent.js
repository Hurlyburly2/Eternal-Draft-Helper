import React from 'react'

export const FormTestComponent = (props) => {
  return(
    
    <div>
       <form id="my_form">
        <input type="file" 
               name="image" 
               id="image_upload" 
               accept="image/*" 
        />
        <input type="submit" value="Submit" />
      </form>
      
      <div id="results" />
    </div>
  )
}

export default FormTestComponent;
