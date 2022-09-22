import neuron.*
neuron_one=neuron()
neuron_one= neuron_one.create_injection_current()
neuron_one=neuron_one.leaky_integrate_and_fire()
neuron_one.plot_neuron()
