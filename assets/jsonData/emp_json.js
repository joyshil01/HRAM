export const emp_json = {
  formTitle: "Add New Employee",
  formDescription: "Employee onbording!",
  formGrid: {
    sm: 12,
    md: 6,
    lg: 4,
  },
  role: "",
  isEditable: true,
  branding: {
    text: "Xyz Pvt Ltd",
    image: "",
  },
  dataSources: [],
  formSteps: [
    {
      stepTitle: "Personal information:",
      stepOrder: 1,
      stepMessage: "",
      inputs: [
        {
          inputId: "fullName",
          label: "Full Name",
          type: "text",
          placeholder: "Employee Name",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Name is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Name length should be less then 255 char",
            },
            minLength: {
              validationValue: 3,
              validationMessage: "Name length should be grater then 3 char",
            },
          },
        },
        {
          inputId: "email",
          label: "E-mail",
          type: "email",
          placeholder: "Employee Email",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Email is required",
            },
            minLength: {
              validationValue: 3,
              validationMessage: "Email length should be grater then 3 char",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Email length should be less then 255 char",
            },
            endsWith: {
              validationValue: ["@gmail.com", "@vitwo.in"],
              validationMessage: "Only google & vitwo mail supported",
            },
          },
        },
        {
          inputId: "phone",
          label: "Phone Number",
          type: "number",
          placeholder: "Employee Phone Number",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Phone number is required",
            },
            maxLength: {
              validationValue: 10,
              validationMessage: "Maximum 10 digit phone supported",
            },
            minLength: {
              validationValue: 3,
              validationMessage: "Name length should be grater then 3 char",
            },
          },
        },
        {
          inputId: "avatar",
          label: "Avatar",
          type: "file",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Avatar is required",
            },
            size: {
              validationValue: 1,
              validationMessage: "Avatar size should be less then 1 MB",
            },
            type: {
              validationValue: "image/*",
              validationMessage: "Only image supported",
            },
          },
        },
        {
          inputId: "Description",
          label: "Description",
          type: "textarea",
          placeholder: "Description",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Description is required",
            },
            maxLength: {
              validationValue: 1255,
              validationMessage:
                "Description length should be less then 1255 char",
            },
            minLength: {
              validationValue: 3,
              validationMessage:
                "Description length should be grater then 3 char",
            },
          },
        },
        {
          inputId: "dateOfBirth",
          label: "Date of Birth",
          type: "date",
          placeholder: "MM/DD/YYYY",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Date of Birth is required",
            },
          },
        },
        {
          inputId: "gender",
          label: "Gender",
          type: "radio",
          options: [
            {
              label: "male",
              value: "Male",
            },
            {
              label: "female",
              value: "Female",
            },
          ],
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Gender is required",
            },
          },
        },
        {
          inputId: "addressArea",
          label: "Address Area",
          type: "text",
          placeholder: "Address area",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Area is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Maximum 255 char supported",
            },
          },
        },
        {
          inputId: "addressPost",
          label: "Post Office",
          type: "text",
          placeholder: "Post Office",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Post Office is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Maximum 255 char supported",
            },
          },
        },
        {
          inputId: "addressPolicStation",
          label: "Polic Station",
          type: "text",
          placeholder: "Polic Station",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Polic Station is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Maximum 255 char supported",
            },
          },
        },
        {
          inputId: "addressDistrict",
          label: "District",
          type: "text",
          placeholder: "District",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "District is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Maximum 255 char supported",
            },
          },
        },
        {
          inputId: "addressState",
          label: "State",
          type: "text",
          placeholder: "State",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "State is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Maximum 255 char supported",
            },
          },
        },
        {
          inputId: "addressPinCode",
          label: "Pin Code",
          type: "number",
          placeholder: "Pin Code",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Pin Code is required",
            },
            maxLength: {
              validationValue: 6,
              validationMessage: "Maximum 6 char supported",
            },
            minLength: {
              validationValue: 3,
              validationMessage: "Name length should be grater then 3 char",
            },
          },
        },
      ],
    },
    {
      stepTitle: "Job information:",
      stepOrder: 2,
      stepMessage: "",
      inputs: [
        {
          inputId: "employeeId",
          label: "Employee ID",
          type: "text",
          placeholder: "Employee ID",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Employee ID is required",
            },
            startWith: {
              validationValue: ["EMP", "INTR"],
              validationMessage: "Id should be start with EMP & INTR",
            },
            maxLength: {
              validationValue: 20,
              validationMessage: "Employee Id should be less then 255",
            },
          },
        },
        {
          inputId: "designation",
          label: "Designation",
          type: "text",
          placeholder: "Employee designation",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Designation is required",
            },
            maxLength: {
              validationValue: 255,
              validationMessage: "Character should be less then 255",
            },
            minLength: {
              validationValue: 3,
              validationMessage: "Character length should be grater then 3",
            },
          },
        },
        {
          inputId: "department",
          label: "Department",
          type: "select",
          placeholder: "Employee Department",
          options: [
            {
              label: "it",
              value: "IT",
            },
            {
              label: "marketing",
              value: "Marketing",
            },
            {
              label: "sales",
              value: "Sales",
            },
          ],
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Department is required",
            },
          },
        },
        {
          inputId: "supervisor",
          label: "Supervisor",
          type: "select",
          placeholder: "Employee Supervisor",
          options: [
            {
              label: "ID-98765432345678",
              value: "Shaikh Salim Akthar",
            },
            {
              label: "ID-7654323456767",
              value: "Imran Ali",
            },
          ],
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Supervisor is required",
            },
          },
        },
        {
          inputId: "dateOfJoining",
          label: "Date of Joining",
          type: "date",
          placeholder: "MM/DD/YYYY",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Date of Joining is required",
            },
          },
        },
        {
          inputId: "salary",
          label: "Salary",
          type: "number",
          placeholder: "Salary",
          validationRules: {
            isRequired: {
              validationValue: 1,
              validationMessage: "Salary is required",
            },
          },
        },
      ],
    },
  ],
};

export const inputFieldGroup = {
  fieldGroup: [
    {
      fieldId: "1",
      label: "Text",
      type: "text",
      placeholder: "Text",
    },
    {
      fieldId: "2",
      label: "Number",
      type: "number",
      placeholder: "Number",
    },
    {
      fieldId: "3",
      label: "Email",
      type: "email",
      placeholder: "Email",
    },
    {
      fieldId: "4",
      label: "Date",
      type: "date",
      placeholder: "Date",
    },
    {
      fieldId: "5",
      label: "Time",
      type: "time",
      placeholder: "Time",
    },
    {
      fieldId: "6",
      label: "Checkbox",
      type: "checkbox",
      placeholder: "Checkbox",
    },
    {
      fieldId: "7",
      label: "Select",
      type: "select",
      placeholder: "Select",
    },
    {
      fieldId: "8",
      label: "Radio",
      type: "radio",
      placeholder: "Radio",
    },
    {
      fieldId: "9",
      label: "Textarea",
      type: "textarea",
      placeholder: "Textarea",
    },
    {
      fieldId: "10",
      label: "File",
      type: "file",
      placeholder: "File",
    },
    {
      fieldId: "11",
      label: "Password",
      type: "password",
      placeholder: "Password",
    },
    {
      fieldId: "12",
      label: "Button",
      type: "button",
      placeholder: "Button",
    },
    {
      fieldId: "13",
      label: "Hidden",
      type: "hidden",
      placeholder: "Hidden",
    },
    {
      fieldId: "14",
      label: "Label",
      type: "label",
      placeholder: "Label",
    },
  ],
};

export const inputFieldAlias = [
  {
    fieldId: "1",
    label: "Text",
    type: "text",
    placeholder: "Text",
  },
  {
    fieldId: "2",
    label: "Number",
    type: "number",
    placeholder: "Number",
  },
  {
    fieldId: "3",
    label: "Email",
    type: "email",
    placeholder: "Email",
  },
  {
    fieldId: "4",
    label: "Date",
    type: "date",
    placeholder: "Date",
  },
  {
    fieldId: "5",
    label: "Time",
    type: "time",
    placeholder: "Time",
  },
  {
    fieldId: "6",
    label: "Checkbox",
    type: "checkbox",
    placeholder: "Checkbox",
  },
  {
    fieldId: "7",
    label: "Select",
    type: "select",
    placeholder: "Select",
  },
  {
    fieldId: "8",
    label: "Radio",
    type: "radio",
    placeholder: "Radio",
  },
  {
    fieldId: "9",
    label: "Textarea",
    type: "textarea",
    placeholder: "Textarea",
  },
  {
    fieldId: "10",
    label: "File",
    type: "file",
    placeholder: "File",
  },
  {
    fieldId: "11",
    label: "Password",
    type: "password",
    placeholder: "Password",
  },
  {
    fieldId: "12",
    label: "Button",
    type: "button",
    placeholder: "Button",
  },
  {
    fieldId: "13",
    label: "Hidden",
    type: "hidden",
    placeholder: "Hidden",
  },
  {
    fieldId: "14",
    label: "Label",
    type: "label",
    placeholder: "Label",
  },
];

export const formInput = {
  name: "Basic Input Form",
  inputs: [
    {
      inputId: "1",
      label: "Input Text",
      type: "text",
      placeholder: "Input Text",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input Text is required",
        },
        maxLength: {
          validationValue: 255,
          validationMessage: "Input length should be less then 255 char",
        },
        minLength: {
          validationValue: 3,
          validationMessage: "Input length should be grater then 3 char",
        },
      },
    },
    {
      inputId: "2",
      label: "Input Email",
      type: "email",
      placeholder: "Input Email",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input email is required",
        },
        minLength: {
          validationValue: 3,
          validationMessage: "Input length should be grater then 3 char",
        },
        maxLength: {
          validationValue: 255,
          validationMessage: "Input length should be less then 255 char",
        },
        endsWith: {
          validationValue: ["@gmail.com", "@vitwo.in"],
          validationMessage: "Only google & vitwo mail supported",
        },
      },
    },
    {
      inputId: "3",
      label: "Input Number",
      type: "number",
      placeholder: "Input Number",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input is required",
        },
        maxLength: {
          validationValue: 10,
          validationMessage: "Maximum 10 digit phone supported",
        },
        minLength: {
          validationValue: 3,
          validationMessage: "Input length should be grater then 3 char",
        },
      },
    },
    {
      inputId: "4",
      label: "Input File",
      type: "file",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "File is required",
        },
        size: {
          validationValue: 1,
          validationMessage: "File size should be less then 1 MB",
        },
        type: {
          validationValue: "image/*",
          validationMessage: "Only image supported",
        },
      },
    },
    {
      inputId: "5",
      label: "Textarea",
      type: "textarea",
      placeholder: "Textarea",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Textarea is required",
        },
        maxLength: {
          validationValue: 1255,
          validationMessage: "Textarea length should be less then 1255 char",
        },
        minLength: {
          validationValue: 3,
          validationMessage: "Textarea length should be grater then 3 char",
        },
      },
    },
    {
      inputId: "6",
      label: "Input Date",
      type: "date",
      placeholder: "MM/DD/YYYY",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input of Birth is required",
        },
      },
    },
    {
      inputId: "7",
      label: "Input Time",
      type: "time",
      placeholder: "HH:MM",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Time is required",
        },
      },
    },
    {
      inputId: "8",
      label: "Checkbox",
      type: "checkbox",
      placeholder: "Checkbox",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Checkbox is required",
        },
      },
    },
    {
      inputId: "9",
      label: "Radio",
      type: "radio",
      options: [
        {
          label: "male",
          value: "Male",
        },
        {
          label: "female",
          value: "Female",
        },
      ],
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input is required",
        },
      },
    },
    {
      inputId: "10",
      label: "Input Password",
      type: "password",
      placeholder: "Input Password",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input Password is required",
        },
        maxLength: {
          validationValue: 255,
          validationMessage: "Input length should be less then 255 char",
        },
        minLength: {
          validationValue: 3,
          validationMessage: "Input length should be grater then 3 char",
        },
      },
    },
    {
      inputId: "11",
      label: "Button",
      type: "button",
      placeholder: "Button",
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Input button is required",
        },
        maxLength: {
          validationValue: 255,
          validationMessage: "Input length should be less then 255 char",
        },
        minLength: {
          validationValue: 3,
          validationMessage: "Input length should be grater then 3 char",
        },
      },
    },
    {
      inputId: "department",
      label: "Department",
      type: "select",
      placeholder: "Employee Department",
      options: [
        {
          label: "it",
          value: "IT",
        },
        {
          label: "marketing",
          value: "Marketing",
        },
        {
          label: "sales",
          value: "Sales",
        },
      ],
      validationRules: {
        isRequired: {
          validationValue: 1,
          validationMessage: "Department is required",
        },
      },
    },
  ],
};
